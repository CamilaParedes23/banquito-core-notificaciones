package com.banquito.platform.notification.grpc;

import io.grpc.Server;
import io.grpc.ServerBuilder;
import io.grpc.ServerInterceptors;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Component
public class NotificationGrpcServer {

    private static final Logger log = LoggerFactory.getLogger(NotificationGrpcServer.class);

    private final int port;
    private final NotificationGrpcService notificationGrpcService;
    private final InternalServiceKeyServerInterceptor internalServiceKeyInterceptor;
    private Server server;

    public NotificationGrpcServer(
            @Value("${banquito.grpc.server.port:9097}") int port,
            NotificationGrpcService notificationGrpcService,
            InternalServiceKeyServerInterceptor internalServiceKeyInterceptor) {
        this.port = port;
        this.notificationGrpcService = notificationGrpcService;
        this.internalServiceKeyInterceptor = internalServiceKeyInterceptor;
    }

    @PostConstruct
    public void start() throws IOException {
        server = ServerBuilder.forPort(port)
                .addService(ServerInterceptors.intercept(
                        notificationGrpcService,
                        internalServiceKeyInterceptor))
                .build()
                .start();
        log.info("Notification gRPC server iniciado en puerto {}", port);
    }

    @PreDestroy
    public void stop() {
        if (server == null) return;
        server.shutdown();
        try {
            if (!server.awaitTermination(5, TimeUnit.SECONDS)) {
                server.shutdownNow();
            }
        } catch (InterruptedException exception) {
            Thread.currentThread().interrupt();
            server.shutdownNow();
        }
    }
}

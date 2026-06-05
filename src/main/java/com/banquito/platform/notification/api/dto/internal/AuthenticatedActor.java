package com.banquito.platform.notification.api.dto.internal;

import java.util.List;

public record AuthenticatedActor(String actorUuid, String actorType, String username, String clientId, List<String> roles, List<String> scopes) { }

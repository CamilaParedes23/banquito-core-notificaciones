package com.banquito.platform.notification.shared.util;

import java.util.Collection;
import java.util.Map;
import java.util.stream.Collectors;

public final class JsonUtil {
    private JsonUtil() {}
    public static String toJson(Map<String, Object> map) {
        if (map == null || map.isEmpty()) return null;
        return "{" + map.entrySet().stream().map(e -> quote(e.getKey()) + ":" + toJsonValue(e.getValue())).collect(Collectors.joining(",")) + "}";
    }
    private static String toJsonValue(Object value) {
        if (value == null) return "null";
        if (value instanceof Number || value instanceof Boolean) return value.toString();
        if (value instanceof Map<?, ?> m) {
            return "{" + m.entrySet().stream().map(e -> quote(String.valueOf(e.getKey())) + ":" + toJsonValue(e.getValue())).collect(Collectors.joining(",")) + "}";
        }
        if (value instanceof Collection<?> c) {
            return "[" + c.stream().map(JsonUtil::toJsonValue).collect(Collectors.joining(",")) + "]";
        }
        return quote(String.valueOf(value));
    }
    private static String quote(String value) {
        if (value == null) return "null";
        return "\"" + value.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\"";
    }
}

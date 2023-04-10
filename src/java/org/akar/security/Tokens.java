
package org.akar.security;

import java.security.SecureRandom;
import java.util.Base64;

public class Tokens {

    private final int tokenLen = 32;

    public String genToken() {
        byte[] bytes = new byte[tokenLen];
        SecureRandom random = new SecureRandom();
        random.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

}

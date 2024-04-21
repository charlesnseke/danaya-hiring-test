package ci.youssoufou.danayahiringtest.infrastructure.exceptions;


public enum CustomExceptionMessageEnum {
    DATA_VIOLATION_INTEGRITY_MESSAGE("Un autre utilisateur existe dans la base de données avec ces mêmes information");

    String value;

    CustomExceptionMessageEnum(String message) {
        value = message;
    }
}

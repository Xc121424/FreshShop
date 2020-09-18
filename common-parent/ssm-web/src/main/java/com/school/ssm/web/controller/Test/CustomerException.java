package com.school.ssm.web.controller.Test;

public class CustomerException extends Exception {
     private String message;

    public CustomerException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}

package com.atai.dental.module.enterp.validator;

import com.atai.dental.module.enterp.form.UserForm;
import com.atai.dental.module.enterp.model.User;
import com.atai.dental.module.enterp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    @Autowired
    private UserService userService;

    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        UserForm userform = (UserForm) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty", "Test");
        if (userform.getUsername().length() < 6 || userform.getUserName().length() > 32) {
            errors.reject("username", "Please use between 6 and 32 characters.");
        }
        if (userService.findByUsername(userform.getUserName()) != null) {
            errors.reject("username", "Someone already has this username.");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (userform.getPassword().length() < 8 || userform.getPassword().length() > 32) {
            errors.reject("password", "Try one with at least 8 characters.");
        }

        if (!userform.getPasswordConfirm().equals(userform.getPassword())) {
            errors.reject("passwordConfirm", "These passwords don't match.");
        }
    }
}

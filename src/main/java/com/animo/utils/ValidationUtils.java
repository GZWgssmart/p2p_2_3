package com.animo.utils;

import com.animo.common.ValidationResult;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.groups.Default;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by Animo on 2017-12-08.
 */
public class ValidationUtils {

    private static Validator validator =  Validation.buildDefaultValidatorFactory().getValidator();

    public static <T> ValidationResult validateEntity(T obj){
        ValidationResult result = new ValidationResult();
        Set<ConstraintViolation<T>> set = validator.validate(obj,Default.class);
        if(!set.isEmpty()){
            result.setHasErrors(true);
            StringBuffer message= new StringBuffer("");
            for(ConstraintViolation<T> cv : set){
                if ("".equals(message.toString())) {
                    message.append(cv.getMessage());
                } else {
                    message.append("/n").append(cv.getMessage());
                }
            }
            result.setErrorMsg(message.toString());
        }
        return result;
    }

    public static <T> ValidationResult validateProperty(T obj,String propertyName){
        ValidationResult result = new ValidationResult();
        Set<ConstraintViolation<T>> set = validator.validateProperty(obj,propertyName,Default.class);
        if( !set.isEmpty()){
            result.setHasErrors(true);
            String message="";
            for(ConstraintViolation<T> cv : set){
                message = cv.getMessage();
            }
            result.setErrorMsg(message);
        }
        return result;
    }

}

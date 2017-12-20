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

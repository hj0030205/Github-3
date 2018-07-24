package com.feline.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.feline.member.MemberModel;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		MemberModel regReq = (MemberModel) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "member_id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "member_name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_pw", "member_pw");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_pwchk", "member_pwchk");
		
		if(!regReq.getMember_pw().equals(regReq.getMember_pwchk()))
		{
			errors.rejectValue("member_pwchk", "mismatch");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_jumin1", "member_jumin1");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_phone", "member_phone");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_zipcode", "member_zipcode");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_addr1", "member_addr1");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_addr2", "member_addr2");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_email", "member_email");
	}
	
	public void validatelogin(Object target, Errors errors)
	{
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "member_id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_pw", "member_pw");
	}
	
	public void validateemail(Object target, Errors errors)
	{
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_email", "member_email");
	}
	
	public void validateid(Object target, Errors errors)
	{
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "member_name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_email", "member_email");
	}
	
	public void validatepw(Object target, Errors errors)
	{
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_id", "member_id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_name", "member_name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_email", "member_email");
	}
}

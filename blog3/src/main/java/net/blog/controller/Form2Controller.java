package net.blog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.blog.dto.Member;
import net.blog.mapper.MemberMapper;

@Controller
public class Form2Controller {
	@Autowired
	MemberMapper memberMapper;

	@GetMapping("form2/register1")
	public String register1(Model model) {
		return "form2/register1";
	}

	@PostMapping("form2/register1")
	public String register1(Model model, HttpSession session, String userid, String name, String password1,
			String password2, String email, String phone1, String phone2, String phone3) {
		String errorMsg = null;
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		if (!userid.matches("^[a-z0-9]{4,16}$"))
			errorMsg = "아이디는 영문소문자/숫자 조합, 4~16자";
		else if (memberMapper.findById(userid) != null)
			errorMsg = "중복된 아이디입니다.";
		else if (!password1.matches("^.*(?=^.{8,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"))
			errorMsg = "비밀번호는 영문 대소문자/숫자/특수문자 조합, 8자~16자";
		else if (password1.equals(password2) == false)
			errorMsg = "비밀번호 불일치";
		else if (name == null || name.length() == 0)
			errorMsg = "이름을 입력하세요";
		else if (phone2.length() != 4 || phone3.length() != 4)
			errorMsg = "휴대전화를 입력하세요";
		else if (email == null || email.length() == 0)
			errorMsg = "이메일 주소를 입력하세요";
		else {
			session.setAttribute("password1", password1);
			session.setAttribute("userid", userid);
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("phone", phone);

			return "redirect:register_success";
		}
		model.addAttribute("userid", userid);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		model.addAttribute("phone", phone);
		model.addAttribute("errorMsg", errorMsg);
		return "form2/register1";
	}

	@RequestMapping("form2/register_success")
	public String register_success1(Model model, Member member) {
		return "form2/register_success";
	}

	@GetMapping("form2/register2")
	public String register2(Model model) {
		Member member = new Member();
		model.addAttribute("member", member);
		return "form2/register1";
	}

	@PostMapping("form2/register2")
    public String register2(Model model, Member member,HttpSession session)
    {
        String errorMsg = null;
        if (! member.getUserid().matches("^[a-z0-9]{4,16}$"))
        	errorMsg = "아이디는 영문소문자/숫자 조합, 4~16자";
        else if( memberMapper.findById(member.getUserid())!=null)
        	errorMsg = "중복된 아이디입니다.";
        else if (! member.getPassword1().matches("^.*(?=^.{8,16}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"))
        	errorMsg = "비밀번호는 영문 대소문자/숫자/특수문자 조합, 8자~16자";
        else if (member.getPassword1().equals(member.getPassword2()) == false)
            errorMsg = "비밀번호 불일치";
        else if (member.getName() == null || member.getName().length() == 0)
            errorMsg = "이름을 입력하세요";
        else if(member.getPhone() == null || member.getPhone().length() <8)
        	errorMsg = "휴대전화를 입력하세요";
        else if (member.getEmail() == null || member.getEmail().length() == 0)
            errorMsg = "이메일 주소를 입력하세요";
        else {
            memberMapper.insert(member);
            session.setAttribute("member", member);
            return "redirect:register_success2";
        }
        model.addAttribute("errorMsg", errorMsg);
        return "form2/register2";
    }

	@RequestMapping("form2/register_success2")
	public String register_success2(Model model, String userid) {
		model.addAttribute("member", memberMapper.findById(userid));
		return "form2/register_success2";
	}

}
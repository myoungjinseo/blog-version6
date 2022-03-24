package net.blog.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import net.blog.dto.Member;
import net.blog.dto.text;
import net.blog.mapper.MemberMapper;
@Controller
public class Form1Controller {
	@Autowired MemberMapper memberMapper;


	@GetMapping("form1/write")
    public String write(Model model) {
		text text = new text();
		model.addAttribute("text", text);
		return "form1/write";
    }

	@PostMapping("form1/write")
	public String write1(Model model, text text, HttpSession session) {

		memberMapper.insert1(text);
		session.setAttribute("text", text);
		return "redirect:main";


	}

	@GetMapping("form1/main")
    public String main(Model model) {
		model.addAttribute("texts", memberMapper.findAll1());
		return "form1/main";
    }
    @GetMapping("loginform/login")
    public String login1(Model model) {
        return "loginform/login";
    }

    @PostMapping("form1/main")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/form1/main";
    }

    @PostMapping("loginform/login")
    public String login1(Model model, String userid, String password1, Boolean autologin, HttpSession session,Member member) {
        String errorMsg = null;
        if( memberMapper.findBypass(userid,password1)==null)
            errorMsg = "아이디 또는 비밀번호를 잘못 입력했습니다."
            		+"입력하신 내용을 다시 확인해주세요.";
        else {
            session.setAttribute("userid", userid);
            return "redirect:/form1/main";
        }
        model.addAttribute("userid", userid);
        model.addAttribute("autologin", autologin);
        model.addAttribute("errorMsg", errorMsg);
        return "loginform/login";
    }


    @GetMapping("loginform/login_success")
    public String login_success(Model model) {
        return "loginform/login_success";
    }

}

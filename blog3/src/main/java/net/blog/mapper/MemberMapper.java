package net.blog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import net.blog.dto.Member;
import net.blog.dto.text;


@Mapper
public interface MemberMapper {

    @Select("SELECT * FROM member WHERE userid = #{userid}")
    Member findById(String userid);

    @Select("SELECT * FROM member WHERE userid = #{userid} and password1 = #{password1}")
    Member findBypass(String userid,String password1);


    @Select("SELECT title FROM text ")
    text findtitle();

    @Select("SELECT maintext FROM text")
    text findtext();

    @Select("SELECT date FROM text")
    text finddate();

    @Select("SELECT userid FROM text")
    text findid();

    @Select("SELECT title,maintext,date,userid FROM text" )
    List<text> findAll1();

    @Insert("INSERT into text (title, maintext, userid) " +
            "VALUES (#{title}, #{maintext},'sih33')")
    public boolean insert1(text text);


    @Select("SELECT userid,name,phone1,phone2,phone3 FROM member" )
    List<Member> findAll();

    @Insert("INSERT member (userid, name, password1, phone1, phone2, phone3, email) " +
            "VALUES (#{userid}, #{name}, #{password1}, #{phone1}, #{phone2}, #{phone3}, #{email})")
    @Options(useGeneratedKeys=true, keyProperty="userid")
    void insert(Member member);
}

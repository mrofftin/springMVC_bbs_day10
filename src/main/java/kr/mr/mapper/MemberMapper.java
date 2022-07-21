package kr.mr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.mr.model.MemberDTO;

// 인터페이스 mapper를 사용시 MemberMapper의 id와 
// 추상메소드명이 일치해야 한다.
// 인터페이스명과 MemberMapper의 namespace명이 일치해야 한다.
// <mapper namespace="mr.web.mybatis.MemberMapper">

// MemberMapper.xml과 인터페이스는 같은 경로상에 있어야 한다. 

//@Mapper // MyBatis(SqlSessionFactory)
public interface MemberMapper {
	 
	public List<MemberDTO> memberList();//memberList() == <select id="memberList"
		
	public int memberInsert(MemberDTO dto);//memberInsert(MemberDTO dto) == <insert id="memberInsert"
	
	public int memberDel(int no);
		
	public MemberDTO memberInfo(int no);
		
	public int memberUpdate(MemberDTO dto);

	public String memberLogin(MemberDTO dto);
}

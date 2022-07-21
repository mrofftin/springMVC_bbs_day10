package kr.mr.model;

import lombok.Data;

@Data
public class MemberDTO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String email;
	private String phone;
	
	private String zipcode;
	private String roadAddr;
	private String jibunAddr;
	private String detailAddr;
	
	// 기본생성자
	public MemberDTO() {}	
	
	// DB에서 조회한 결과를 이용시 num 필요
	public MemberDTO(int no, String id, String pw, String name, int age, String email, String phone, String zipcode,
			String roadAddr, String jibunAddr, String detailAddr) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.roadAddr = roadAddr;
		this.jibunAddr = jibunAddr;
		this.detailAddr = detailAddr;
	}


	// 데이터 입력 시 no 필요 없음
	public MemberDTO(String id, String pw, String name, int age, String email, String phone, String zipcode,
			String roadAddr, String jibunAddr, String detailAddr) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.roadAddr = roadAddr;
		this.jibunAddr = jibunAddr;
		this.detailAddr = detailAddr;
	}
	
//	public String getZipcode() {
//		return zipcode;
//	}
//
//	public void setZipcode(String zipcode) {
//		this.zipcode = zipcode;
//	}
//
//	public String getRoadAddr() {
//		return roadAddr;
//	}
//
//	public void setRoadAddr(String roadAddr) {
//		this.roadAddr = roadAddr;
//	}
//
//	public String getJibunAddr() {
//		return jibunAddr;
//	}
//
//	public void setJibunAddr(String jibunAddr) {
//		this.jibunAddr = jibunAddr;
//	}
//
//	public String getDetailAddr() {
//		return detailAddr;
//	}
//
//	public void setDetailAddr(String detailAddr) {
//		this.detailAddr = detailAddr;
//	}
//
//	public int getNo() {
//		return no;
//	}
//
//	public void setNo(int no) {
//		this.no = no;
//	}
//
//	public String getId() {
//		return id;
//	}
//
//	public void setId(String id) {
//		this.id = id;
//	}
//
//	public String getPw() {
//		return pw;
//	}
//
//	public void setPw(String pw) {
//		this.pw = pw;
//	}
//
//	public String getName() {
//		return name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public int getAge() {
//		return age;
//	}
//
//	public void setAge(int age) {
//		this.age = age;
//	}
//
//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//	public String getPhone() {
//		return phone;
//	}
//
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//
//	// Debugging 용으로 주로 사용
//	@Override
//	public String toString() {
//		return "MemberDTO [no=" + no + ", id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", email="
//				+ email + ", phone=" + phone + ", zipcode=" + zipcode + ", roadAddr=" + roadAddr + ", jibunAddr="
//				+ jibunAddr + ", detailAddr=" + detailAddr + "]";
//	}
}

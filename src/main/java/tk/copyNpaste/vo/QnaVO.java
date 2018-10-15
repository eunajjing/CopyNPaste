/*
* @ Class : QnaVO
* @ Date : 2018.10.06
* @ Author : boatemplate
* @ Desc : QnaVO
*/
package tk.copyNpaste.vo;

import java.util.Date;

public class QnaVO {
	//QnaVO
	
	//QNA 게시판
	//QnA번호,회원이메일,QnA제목,QnA내용,QnA작성일,답글깊이,부모qna번호,공지글여부,비밀글여부
	private int qnaNum;
	private String userEmail;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaDept;
	private int qnaPNum;
	private int qnaNotice;
	private int qnaSecret;

	
	
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaDept() {
		return qnaDept;
	}
	public void setQnaDept(int qnaDept) {
		this.qnaDept = qnaDept;
	}
	public int getQnaPNum() {
		return qnaPNum;
	}
	public void setQnaPNum(int qnaPNum) {
		this.qnaPNum = qnaPNum;
	}
	public int getQnaNotice() {
		return qnaNotice;
	}
	public void setQnaNotice(int qnaNotice) {
		this.qnaNotice = qnaNotice;
	}
	public int getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(int qnaSecret) {
		this.qnaSecret = qnaSecret;
	}


}

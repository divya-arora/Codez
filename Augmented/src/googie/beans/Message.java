package googie.beans;

public class Message {
	private int msgid;
	private String senderid;
	private String receiverid;
	private String message;
	private java.sql.Date date;
	private String subject;
	private int sstatus;
	private int rstatus;
	public int getMsgid() {
		return msgid;
	}
	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}
	public String getSenderid() {
		return senderid;
	}
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}
	public String getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public java.sql.Date getDate() {
		return date;
	}
	public void setDate(java.sql.Date date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getSstatus() {
		return sstatus;
	}
	public void setSstatus(int sstatus) {
		this.sstatus = sstatus;
	}
	public int getRstatus() {
		return rstatus;
	}
	public void setRstatus(int rstatus) {
		this.rstatus = rstatus;
	}
	

}

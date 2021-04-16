package model;


public class MessageBean {

	private String userName;
	private String message;
	private String date;
	private String time;
	private String tag;

	public MessageBean() {

	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		String[] dateTime = date.split(" ");
		
		this.date = dateTime[0];
		setTime(dateTime[1].substring(0, 5));
	}

	public String getTime() {
		return time;
	}

	private void setTime(String time) {
		this.time = time;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	

}

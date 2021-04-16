package model;

import database.SQLUserCon;

public class UserBean {
	
	
		private String name, password, email;
		private String styleSheet = "style.css";
		

		public String getStyleSheet() {
			return styleSheet;
		}

		public void setStyleSheet(String styleSheet) {
			this.styleSheet = styleSheet;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		
		}
		public boolean validate(UserBean bean) {
			
			if (SQLUserCon.connectSQL()) {
				return SQLUserCon.stateSQL(bean);
	    	}
		
			return false;
		}
		public void resetUserBean() {
			this.password = null;
			this.name = null;
		}

}

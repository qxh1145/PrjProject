package model;

import java.util.Date;

public class User {
    private String username;
    private String password;
    private String accountType;
    private Date premiumExpiryDate;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
        this.accountType = "Free"; // Default to Free account
        this.premiumExpiryDate = null;
    }

    public User(String username, String password, String accountType, Date premiumExpiryDate) {
        this.username = username;
        this.password = password;
        this.accountType = accountType;
        this.premiumExpiryDate = premiumExpiryDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public Date getPremiumExpiryDate() {
        return premiumExpiryDate;
    }

    public void setPremiumExpiryDate(Date premiumExpiryDate) {
        this.premiumExpiryDate = premiumExpiryDate;
    }
} 
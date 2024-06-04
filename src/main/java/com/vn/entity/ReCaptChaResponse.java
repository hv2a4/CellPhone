package com.vn.entity;

import lombok.Data;

@Data
public class ReCaptChaResponse {
	 private boolean success;
	  private String challenge_ts;
	  private String hostName;
}

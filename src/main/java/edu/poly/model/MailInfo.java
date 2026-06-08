package edu.poly.model;

import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailInfo {
	@NotBlank
	private String from;
	@NotBlank
	private String to;
	private String[] cc;
	private String[] bcc;
	@NotBlank
	private String subject;
	@NotBlank
	private String body;
	private String[] attachments;
	
	public MailInfo(String to, String subject, String body) {
		this.from = "bazzaar <manltnps38937@gmail.com>";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}

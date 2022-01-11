package com.xyz.xyzhotel.functions;


import com.vonage.client.VonageClient;
import com.vonage.client.sms.MessageStatus;
import com.vonage.client.sms.messages.Message;
import com.vonage.client.sms.SmsSubmissionResponse;
import com.vonage.client.sms.messages.TextMessage;

public class SmsSender
{
    public void send()
    {
        VonageClient client = VonageClient.builder().apiKey("3a3ff713").apiSecret("wwemMyTvrXw8Ystj").build();

        Message message = new TextMessage("Vonage APIs",
                "94779595877",
                "A text message sent using the Vonage SMS API"
        );

        SmsSubmissionResponse response = client.getSmsClient().submitMessage(message);

        if (response.getMessages().get(0).getStatus() == MessageStatus.OK) {
            System.out.println("Message sent successfully.");
        } else {
            System.out.println("Message failed with error: " + response.getMessages().get(0).getErrorText());
        }
    }
}


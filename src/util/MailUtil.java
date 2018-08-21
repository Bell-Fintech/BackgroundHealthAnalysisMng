package HealthAnalysisMng.util;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * @ClassName: MailUtil
 * @Description: 发送邮件工具库
 * @author DingMingliang
 * @date 2014年10月31日 下午6:52:25
 */
public class MailUtil {

    private MimeMessage mimeMsg;
    private Session session;
    private Properties props;
    /**
     * @Fields needAuth : 是否需要认证stmp
     */
    private boolean needAuth = false;
    private String username;
    private String password;
    private Multipart mp;

    /**
     * Constructor
     * 
     * @param smtp
     *            邮件发送服务器
     */
    public MailUtil(String smtp) {
        setSmtpHost(smtp);
        createMimeMessage();
    }

    /**
     * 设置邮件发送服务器
     * 
     * @param hostName
     *            String
     */
    public void setSmtpHost(String hostName) {
        if (props == null)
            props = System.getProperties();
        props.put("mail.smtp.host", hostName);
    }

    /**
     * 创建MIME邮件对象
     * 
     * @return
     */
    public boolean createMimeMessage() {
        try {
            session = Session.getDefaultInstance(props, null);
        } catch (Exception e) {
            return false;
        }

        try {
            mimeMsg = new MimeMessage(session);
            mp = new MimeMultipart();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 设置SMTP是否需要验证
     * 
     * @param need
     */
    public void setNeedAuth(boolean need) {
        if (props == null)
            props = System.getProperties();
        if (need) {
            props.put("mail.smtp.auth", "true");
        } else {
            props.put("mail.smtp.auth", "false");
        }
    }

    /**
     * 设置用户名和密码
     * 
     * @param name
     * @param pass
     */
    public void setNamePass(String name, String pass) {
        username = name;
        password = pass;
    }

    /**
     * 设置邮件主题
     * 
     * @param mailSubject
     * @return
     */
    public boolean setSubject(String mailSubject) {
        try {
            mimeMsg.setSubject(mailSubject);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 设置邮件正文
     * 
     * @param mailBody
     *            String
     */
    public boolean setBody(String mailBody) {
        try {
            BodyPart bp = new MimeBodyPart();
            // 设置编码格式
            bp.setContent("" + mailBody, "text/html;charset=GBK");
            mp.addBodyPart(bp);

            return true;
        } catch (Exception e) {
            return false;
        }
    }
    /**
     * 添加附件
     * 
     * @param filename
     *            String
     */
    public boolean addFileAffix(String filename) {

        try {
            BodyPart bp = new MimeBodyPart();
            FileDataSource fileds = new FileDataSource(filename);
            bp.setDataHandler(new DataHandler(fileds));
            // 设置编码格式
            bp.setFileName("=?UTF-8?B?" + new sun.misc.BASE64Encoder().encode(fileds.getName().getBytes()) + "?=");
            mp.addBodyPart(bp);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 设置发信人
     * 
     * @param from
     *            String
     */
    public boolean setFrom(String from) {
        try {
            mimeMsg.setFrom(new InternetAddress(from));
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    /**
     * 设置收信人
     * 
     * @param to
     *            String
     */
    public boolean setTo(String to) {
        if (to == null)
            return false;
        try {
            mimeMsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 设置抄送人
     * 
     * @param copyto
     *            String
     */
    public boolean setCopyTo(String copyto) {
        if (copyto == null)
            return false;
        try {
            mimeMsg.setRecipients(Message.RecipientType.CC, (Address[]) InternetAddress.parse(copyto));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 发送邮件
     */
    public boolean sendOut() {
        try {
            mimeMsg.setContent(mp);
            mimeMsg.saveChanges();

            Session mailSession = Session.getInstance(props, null);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect((String) props.get("mail.smtp.host"), username, password);
            transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.TO));
            transport.sendMessage(mimeMsg, mimeMsg.getRecipients(Message.RecipientType.CC));

            transport.close();

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 调用sendOut方法完成邮件发送
     * 
     * @param smtp
     * @param from
     * @param to
     * @param subject
     * @param content
     * @param username
     * @param password
     * @return boolean
     */
    public static boolean send(String smtp, String from, String to, String subject, String content, String username,
            String password) {
        MailUtil theMail = new MailUtil(smtp);
        theMail.setNeedAuth(true);

        if (!theMail.setSubject(subject))
            return false;
        if (!theMail.setBody(content))
            return false;
        if (!theMail.setTo(to))
            return false;
        if (!theMail.setFrom(from))
            return false;
        theMail.setNamePass(username, password);

        if (!theMail.sendOut())
            return false;
        return true;
    }

    /**
     * 调用sendOut方法完成邮件发送,带抄送
     * 
     * @param smtp
     * @param from
     * @param to
     * @param copyto
     * @param subject
     * @param content
     * @param username
     * @param password
     * @return boolean
     */
    public static boolean sendAndCc(String smtp, String from, String to, String copyto, String subject, String content,
            String username, String password) {
        MailUtil theMail = new MailUtil(smtp);
        theMail.setNeedAuth(true);

        if (!theMail.setSubject(subject))
            return false;
        if (!theMail.setBody(content))
            return false;
        if (!theMail.setTo(to))
            return false;
        if (!theMail.setCopyTo(copyto))
            return false;
        if (!theMail.setFrom(from))
            return false;
        theMail.setNamePass(username, password);

        if (!theMail.sendOut())
            return false;
        return true;
    }

    /**
     * 调用sendOut方法完成邮件发送,带附件
     * 
     * @param smtp
     * @param from
     * @param to
     * @param subject
     * @param content
     * @param username
     * @param password
     * @param filename
     *            附件路径
     * @return
     */
    public static boolean send(String smtp, String from, String to, String subject, String content, String username,
            String password, String filename) {
        MailUtil theMail = new MailUtil(smtp);
        theMail.setNeedAuth(true);

        if (!theMail.setSubject(subject))
            return false;
        if (!theMail.setBody(content))
            return false;
        if (!theMail.addFileAffix(filename))
            return false;
        if (!theMail.setTo(to))
            return false;
        if (!theMail.setFrom(from))
            return false;
        theMail.setNamePass(username, password);

        if (!theMail.sendOut())
            return false;
        return true;
    }

    /**
     * 调用sendOut方法完成邮件发送,带附件和抄送
     * 
     * @param smtp
     * @param from
     * @param to
     * @param copyto
     * @param subject
     * @param content
     * @param username
     * @param password
     * @param filename
     * @return
     */
    public static boolean sendAndCc(String smtp, String from, String to, String copyto, String subject, String content,
            String username, String password, String filename) {
        MailUtil theMail = new MailUtil(smtp);
        theMail.setNeedAuth(true);

        if (!theMail.setSubject(subject))
            return false;
        if (!theMail.setBody(content))
            return false;
        if (!theMail.addFileAffix(filename))
            return false;
        if (!theMail.setTo(to))
            return false;
        if (!theMail.setCopyTo(copyto))
            return false;
        if (!theMail.setFrom(from))
            return false;
        theMail.setNamePass(username, password);

        if (!theMail.sendOut())
            return false;
        return true;
    }
    public static void main(String[] args) {
        String smtp = "smtp.qq.com";
        String from = "290035317@qq.com";
        String to = "shengling@judon.com.cn";
        String copyto = "dingmingliang@judon.com.cn";
        String subject = "邮件主题";
        String content = "邮件内容";
        String username = "290035317";
        String password = "moD729426";
        String filename = "C:\\code\\测试.txt";
        MailUtil.send(smtp, from, to, subject, content, username, password);
    }
}

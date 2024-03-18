using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace H3ArT.Utility
{
    public class EmailSender : IEmailSender
    {
        public string Email {  get; set; }
        public string Password { get; set; }

        public EmailSender(IConfiguration _config)
        {
            Email = _config.GetValue<string>("SendEmail:Gmail");
            Password = _config.GetValue<string>("SendEmail:Password");
        }
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            string _from = Email;
            MailMessage message = new MailMessage(_from, email, subject, htmlMessage);
            message.BodyEncoding = System.Text.Encoding.UTF8;
            message.SubjectEncoding = System.Text.Encoding.UTF8;
            message.IsBodyHtml = true;

            message.ReplyToList.Add(new MailAddress(_from));
            message.Sender = new MailAddress(_from);

            using var smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new NetworkCredential(Email, Password);

            try
            {
                await smtpClient.SendMailAsync(message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}

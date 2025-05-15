using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class User
    {
        public int UserID { get; set; }  // Auto-incremented ID
        public string Username { get; set; }  // User's username
        public string PasswordHash { get; set; }  // Hashed password for security
        public string Role { get; set; }  // User role (Admin, Staff, etc.)
    }
}

using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace PlacementCell
{
    public class HashGenerator
    {
        public static string getHash (string user,string pass)
        {
            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            var hash =  sha.ComputeHash(System.Text.Encoding.ASCII.GetBytes(user + pass));
            var strPassHash = new StringBuilder();
            for (var i = 0; i < hash.Length; i++)
            {
                strPassHash.Append(hash[i].ToString("X2"));
            }
            return strPassHash.ToString();
        }

        public static bool matchHash(byte[] myHash,byte[] storedHash)
        {
            bool result = false;
            if (myHash != null && storedHash != null)
            {
                if (myHash.Length == storedHash.Length)
                {
                    result = true;
                    for (int i = 0; i < myHash.Length; i++)
                    {
                        if (myHash[i] != storedHash[i])
                        {
                           result = false;
                            break;
                        }
                    }
                }
            }
            return result;
        }

        public static string getUniqueID() {
            var random = new RNGCryptoServiceProvider();
            var randomBytes = new byte[95];
            random.GetBytes(randomBytes); // fills randomBytes with random bytes
            var token = HttpServerUtility.UrlTokenEncode(randomBytes); // unlike straight-up Base64, safe in URLs
            return token;
        }
    }
}
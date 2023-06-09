const fs = require("fs");
const homedir = require('os').homedir();

const accounts = [
    {
        name: "goribco_spaik",
        account: '1234567890',
        aws_access_key_id: "AKIAQC4SDWSLOWP",
        aws_secret_access_key: "lkgSCDqasSDBH+olR64rc+IDRw"
    },
    {
        name: "goribco_dev1",
        account: '0987654321',
        aws_access_key_id: "PKIAQC4SDWSLOWQ",
        aws_secret_access_key: "ckgSCDqasSDBH+olR64rc+a"
    }
]

let config_output = "";
let credentials_output = "";
accounts.forEach((a) => {
    const name = a.name;
    console.log(name);
    config_output += `
[profile ${name}]
sso_start_url = https://your_sso_domain.awsapps.com/start
sso_region = us-east-1
sso_account_id = ${a.account}
sso_role_name = AdministratorAccess
region = us-east-2\n\n`;

    credentials_output += `
[${name}]
aws_access_key_id=${a.aws_access_key_id}
aws_secret_access_key=${a.aws_secret_access_key}\n\n`;
});


const config_filepath = `${homedir}/.aws/config`;

fs.writeFile(config_filepath, config_output, (err) => {
    if (err) return console.error(err);
    console.log("\nConfig file updated!");
});

const credentials_filepath = `${homedir}/.aws/credentials`;

fs.writeFile(credentials_filepath, credentials_output, (err) => {
    if (err) return console.error(err);
    console.log("\nCredentials file updated!");
});
# go-ssh

Helper script for SSH connections.

## Prerequisites

* [uv Python package manager](https://docs.astral.sh/uv/getting-started/installation/)
* ssh
* sshpass

## Configuration

Open the script and locate the `host_definitions` assignment statement.  The default looks like this:

```python
host_definitions = [
    HostDefinition("u50", "unix50.org", "unix50", "unix50", PasswordType.INLINE)
]
```

Add a `HostDefinition` initializer with info for each site you want to connect to.  The arguments to the `HostDefinition` constructor are as follows:

Argument | Description | Required?
-------- | ----------- | ---------
description | Used as the -d argument to indicate which definition to use for connecting. | Yes
hostname | The remote host name. | Yes
username | The user name to use when connecting. | Yes
password | The password to use when connecting. | No (defaults to blank)
password_type | An enum indicating the format of the password entry. | No (defaults to `PasswordType.PROMPT`)
port | The port to use when connecting. | No (defaults to 22)

The password type can be any of the following:

Value | Description
----- | -----------
PasswordType.INLINE | The password field contains the actual password.
PasswordType.ENV_VARIABLE | The password field contains the name of an environment value that holds the actual password value.
PasswordType.PROMPT | The user should be prompted to enter a password.

Additionally, the INLINE and ENV_VARIABLE values can be overridden with the `-p` argument if you want to be prompted.

The script accepts the following arguments:

Argument | Description
-------- | -----------
-d DESCRIPTION, --description DESCRIPTION | Connect using the host definition that matches DESCRIPTION
-p, --password | Prompt the user for a password, regardless of the password type.
-l, --list | Display a list of all host definition entries.

For example, to connect using the "u50" host definition, you'd invoke the script as follows:

```bash
go_ssh -d u50
```

The script will then construct and execute a call to `ssh` that looks like this:

```bash
sshpass -p unix50 ssh -p 22 unix50@unix50.org
```

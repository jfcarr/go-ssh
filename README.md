# go-ssh

Helper script for SSH connections.

## Prerequisites

* [uv Python package manager](https://docs.astral.sh/uv/getting-started/installation/)
* ssh
* sshpass

## Configuration

1. Make a copy of `go_ssh.json`:

```bash
cp go_ssh.json go_ssh_live.json
```

2. Update `go_ssh_live.json` with entries for all of your host definitions.

The type (connection type) can any of the following:

Value | Description
----- | -----------
ssh | Connect using ssh.
sftp | Connect using sftp.

The password type can be any of the following:

Value | Description
----- | -----------
inline | The password field contains the actual password.
env_variable | The password field contains the name of an environment value that holds the actual password value.
prompt | The user should be prompted to enter a password.

Additionally, the `inline` and `env_variable` values can be overridden with the `-p` argument if you want to be prompted.

3. Deploy live script with `make deploy`.

## Usage

The script accepts the following arguments:

Argument | Description
-------- | -----------
-i ID, --id ID | Connect using the host definition that matches ID
-t TYPE, --type TYPE | Connection type, 'ssh' or 'sftp'.  Optional: defaults to 'ssh'.
-p, --password | Prompt the user for a password, regardless of the password type.
-l, --list | Display a list of all host definition entries.

For example, to connect as ssh, using the "u50" host definition, you'd invoke the script as follows:

```bash
go_ssh -i u50
```

The script will then construct and execute a call to `ssh` that looks like this:

```bash
sshpass -p unix50 ssh -p 22 unix50@unix50.org
```

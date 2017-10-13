# DevOps-tech-task

The first file RideAmigos.sh contains the script to check if the log file, file2, has lines matching the packages contained in file1.
If they do then they are written to file3 - highlighting the package names from file1
They are also sorted so we know which ones were most recent

If logs were written to file3, meaning there were false positives, we need to run the property database on required servers

This would also create a problem - file3 would be populated from previous if this were to run a second time.
Therefore, either the file should be removed after viewing it or we must generate a new file everyday.


The second file script.sh runs the command sudo rkhunter --propupd
sudoers file is edited from the script so that the user doesnt have to manually input the password


With more time, I would develop a way to check the affected servers - probably with puppet which would look something like this:
file { '/path/to/script.sh':
  ensure   => present,
  source   => 'puppet:///modules/webconfig/script.sh',
  mode     => '0644',
  owner    => 'root',
  group    => 'root',
}
->
exec { 'Generate the config':
  command  => '/path/to/script.sh',
  cwd      => '/path/to',
  user     => 'root',
}
->
exec { 'SCP the config':
  command  => 'scp /usr/local/conf/app.conf user@remote-server:',
  cwd      => '/path/to',
  user     => 'root',
}




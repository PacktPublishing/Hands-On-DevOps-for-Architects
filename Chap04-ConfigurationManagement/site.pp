node default { }
node 'linuxagent.example.com' {
  include lampserver
}
node 'windowsagent.example.com' {
  include iisserver
}

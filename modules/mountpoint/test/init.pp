mounts { 'Test NFS mount':
  mountlist => ['nfs', 'test'],
  source => '/dev/sdb2',
  dest   => '/a/path/to/data',
}


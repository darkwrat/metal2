class justpkg {

  create_resources('package', lookup('justpkg::installed', Hash, 'deep', {}))

}
# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab

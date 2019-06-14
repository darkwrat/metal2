plan kick(
    TargetSpec $nodes,
    Boolean $noop = true,
) {

  $nodes.apply_prep

  apply($nodes, _catch_errors => true, _noop => $noop) {
    difference(
      lookup('classes', Array[String], 'unique'),
      lookup('classes_exclude', Array[String], 'unique', [])
    ).include
  }.each |$result| {
    notice($result)
    $result.report['logs'].each | $line | {
      if $line['level'] == 'err' {
        err($line)
      } else {
        notice($line)
      }
    }
  }

}

# vim: syntax=ruby:ts=2:shiftwidth=2:expandtab

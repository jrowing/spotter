use Parse;

foreach $t(
  ['3/4',-1],
  ['(1.8+0)*10^12',-1],
  ['34',2],
  ['345',3],
  ['10^5',0],
  ['+10^5',0],
  ['-10^5',0],
  ['7.89 10^17',3],
  ['7.89*10^17',3],
  ['7.89 * 10 ^ 17',3],
  ['789 10^17',3],
  ['789 10^+17',3],
  ['789 10^-17',3],
  ['+789 10^17',3],
  ['-789 10^17',3],
  ['-789 10^-17',3],
  ['5400',2],
  ['5400.1',5],
  ['5400.0',5],
  ['1.03',3],
  ['.0000077',2],
  ['0.000000088',2],
) {
  $e=$t->[0];
  $s=$t->[1];
  $q = Parse::count_sig_figs($e);
  print "$e has $q sig figs\n";
  if ($q!=$s) {
    die "error: should have had $s sig figs";
  }
}

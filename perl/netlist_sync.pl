#!/usr/bin/perl -w

use Getopt::Long;
use Time::Local;
use POSIX;
use pipe;

my $g_description = 
'
Overview
--------
netlist_sync.pl is used to synchronize changes from source netlist to target netlist
'
;

#########################
# parse the command line
#########################
my ($opt_h,             # help
    $opt_src_file,      # source netlist file
    $opt_dst_file,      # target netlist file
    $opt_author,        # executor for changes
    $opt_mode,          # working mode
    $opt_ecoid,         # eco id
);

GetOptions ("h!"            => \$opt_h,
            "src_file=s"    => \$opt_src_file,
            "dst_file=s"    => \$opt_dst_file,
            "author=s"      => \$opt_author,
            "mode=s"        => \$opt_mode,
            "ecoid=s"       => \$opt_ecoid,
);

#--------------------------------------
sub PrintUsage() {
    print "\n";
    print "Usage\n";
    print "-----\n";
    print "netlist_sync [options] \n";

    my $usage_message = <<'EOF2';
-h                  Print this message.
-src_file           Set the source netlist file path.
-dst_file           Set the target netlist file path.
-author             Set the executor for changes.
-mode               Set the working mode, including 'init2dft' and 'dft2pr'.
-ecoid              Set the ECOID string.
EOF2
    print "\n$usage_message\n";
}

#--------------------------------------
sub ValidateOption() {
    if ($opt_h) {
        print $g_description;
        &PrintUsage();
        exit;
    }
    unless (defined($opt_src_file)) {
        print "Source netlist file is not defined, please check!\n";
        exit;
    }
    unless (defined($opt_dst_file)) {
        print "target netlist file is not defined, please check!\n";
        exit;
    }
    unless (defined($opt_author)) {
        print "Author is not defined, please check!\n";
        exit;
    }
    unless (defined($opt_mode)) {
        print "Working mode is not defined, please check!\n";
        exit;
    }
    unless (defined($opt_ecoid)) {
        print "ECOID string is not defined, please check!\n";
        exit;
    }

    unless (-e $opt_src_file) {
        print "source netlist file is not exist, please check!\n";
        exit;
    }
    unless (-e $opt_dst_file) {
        print "target netlist file is not exist, please check!\n";
        exit;
    }
    unless ($opt_mode ne "init2dft" or $opt_mode ne "dft2pr") {
        print "working mode is wrong, please check!\n";
        exit;
    }
}

&ValidateOption();

#--------------------------------------
sub ReadSrcFile() {
    my $file_name   = shift @_;
}

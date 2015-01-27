#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MiaNet');

$t->get_ok('/')->text_is('title' => 'Mia.Net', 'title in default page');
$t->post_ok('/login', form => { name => 'carmit', password => 'evohack'})->json_is('/id' => 2, "user exists");
$t->post_ok('/login', form => { name => 'carmit', password => 'evddsohack'})->json_is('/invalid' => Mojo::JSON->true, "wrong password");
$t->post_ok('/login', form => { name => 'cat', password => 'evohack'})->json_is('/invalid' => Mojo::JSON->true, "unknown user");
$t->post_ok('/login', json => { name => 'carmit', password => 'evohack'})->json_is('/id' => 2, "user exists");
$t->post_ok('/login', json => { name => 'carmit', password => 'evddsohack'})->json_is('/invalid' => Mojo::JSON->true, "wrong password");
$t->post_ok('/login', json => { name => 'cat', password => 'evohack'})->json_is('/invalid' => Mojo::JSON->true, "unknown user");

done_testing();



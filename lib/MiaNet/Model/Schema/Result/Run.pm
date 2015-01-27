use utf8;
package MiaNet::Model::Schema::Result::Run;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Run

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<runs>

=cut

__PACKAGE__->table("runs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 start_time

  data_type: 'integer'
  is_nullable: 1

=head2 end_time

  data_type: 'integer'
  is_nullable: 1

=head2 project

  data_type: 'varchar2'
  is_nullable: 1
  size: 60

=head2 experiment

  data_type: 'varchar2'
  is_nullable: 1
  size: 10

=head2 quantity

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "user",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "start_time",
  { data_type => "integer", is_nullable => 1 },
  "end_time",
  { data_type => "integer", is_nullable => 1 },
  "project",
  { data_type => "varchar2", is_nullable => 1, size => 60 },
  "experiment",
  { data_type => "varchar2", is_nullable => 1, size => 10 },
  "quantity",
  { data_type => "numeric", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 protocol

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "MiaNet::Model::Schema::Result::Protocol",
  { id => "protocol_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "MiaNet::Model::Schema::Result::User",
  { id => "user" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aSEfXVcNyJ6gFwCUtF3lsg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

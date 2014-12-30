use utf8;
package MiaNet::Model::Schema::Result::Stage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Stage

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<stages>

=cut

__PACKAGE__->table("stages");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar2'
  is_nullable: 0
  size: 200

=head2 description

  data_type: 'varchar2'
  is_nullable: 1
  size: 2000

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar2", is_nullable => 0, size => 200 },
  "description",
  { data_type => "varchar2", is_nullable => 1, size => 2000 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
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

=head2 steps

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Step>

=cut

__PACKAGE__->has_many(
  "steps",
  "MiaNet::Model::Schema::Result::Step",
  { "foreign.stage" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:x//5dIkBAbVsYJ6MbbyFhw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

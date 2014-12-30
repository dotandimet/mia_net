use utf8;
package MiaNet::Model::Schema::Result::Protocol;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Protocol

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<protocols>

=cut

__PACKAGE__->table("protocols");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar2'
  is_nullable: 0
  size: 200

=head2 description

  data_type: 'varchar2'
  is_nullable: 1
  size: 2000

=head2 version

  data_type: 'integer'
  default_value: 1
  is_nullable: 0

=head2 status

  data_type: 'varchar2'
  default_value: 'draft'
  is_foreign_key: 1
  is_nullable: 1
  size: 10

=head2 base_quantity

  data_type: 'numeric'
  is_nullable: 1

=head2 base_units

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 1
  size: 10

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar2", is_nullable => 0, size => 200 },
  "description",
  { data_type => "varchar2", is_nullable => 1, size => 2000 },
  "version",
  { data_type => "integer", default_value => 1, is_nullable => 0 },
  "status",
  {
    data_type => "varchar2",
    default_value => "draft",
    is_foreign_key => 1,
    is_nullable => 1,
    size => 10,
  },
  "base_quantity",
  { data_type => "numeric", is_nullable => 1 },
  "base_units",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 1, size => 10 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 base_unit

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Unit>

=cut

__PACKAGE__->belongs_to(
  "base_unit",
  "MiaNet::Model::Schema::Result::Unit",
  { name => "base_units" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 ingredients

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Ingredient>

=cut

__PACKAGE__->has_many(
  "ingredients",
  "MiaNet::Model::Schema::Result::Ingredient",
  { "foreign.protocol_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 runs

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Run>

=cut

__PACKAGE__->has_many(
  "runs",
  "MiaNet::Model::Schema::Result::Run",
  { "foreign.protocol_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stages

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Stage>

=cut

__PACKAGE__->has_many(
  "stages",
  "MiaNet::Model::Schema::Result::Stage",
  { "foreign.protocol_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 status

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::ApprovalStatus>

=cut

__PACKAGE__->belongs_to(
  "status",
  "MiaNet::Model::Schema::Result::ApprovalStatus",
  { name => "status" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 steps

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Step>

=cut

__PACKAGE__->has_many(
  "steps",
  "MiaNet::Model::Schema::Result::Step",
  { "foreign.protocol_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:em8CEraed5TCyIh/q0RbOw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

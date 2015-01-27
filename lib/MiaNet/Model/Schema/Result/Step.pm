use utf8;
package MiaNet::Model::Schema::Result::Step;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Step

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<steps>

=cut

__PACKAGE__->table("steps");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 protocol_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 step

  data_type: 'integer'
  is_nullable: 0

=head2 text

  data_type: 'varchar2'
  is_nullable: 0
  size: 2000

=head2 stage

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "protocol_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "step",
  { data_type => "integer", is_nullable => 0 },
  "text",
  { data_type => "varchar2", is_nullable => 0, size => 2000 },
  "stage",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<protocol_id_step_unique>

=over 4

=item * L</protocol_id>

=item * L</step>

=back

=cut

__PACKAGE__->add_unique_constraint("protocol_id_step_unique", ["protocol_id", "step"]);

=head1 RELATIONS

=head2 ingredients

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::Ingredient>

=cut

__PACKAGE__->has_many(
  "ingredients",
  "MiaNet::Model::Schema::Result::Ingredient",
  { "foreign.step_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 record_fields

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::RecordField>

=cut

__PACKAGE__->has_many(
  "record_fields",
  "MiaNet::Model::Schema::Result::RecordField",
  { "foreign.step_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 run_steps

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::RunStep>

=cut

__PACKAGE__->has_many(
  "run_steps",
  "MiaNet::Model::Schema::Result::RunStep",
  { "foreign.step_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 stage

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Stage>

=cut

__PACKAGE__->belongs_to(
  "stage",
  "MiaNet::Model::Schema::Result::Stage",
  { id => "stage" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7EdKuldH+NWH1EXGfkc+UQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

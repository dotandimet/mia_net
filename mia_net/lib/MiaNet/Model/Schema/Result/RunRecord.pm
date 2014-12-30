use utf8;
package MiaNet::Model::Schema::Result::RunRecord;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::RunRecord

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<run_records>

=cut

__PACKAGE__->table("run_records");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 step_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 record_field_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 record_field_value

  data_type: 'varchar2'
  is_nullable: 1
  size: 500

=head2 batch_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "step_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "record_field_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "record_field_value",
  { data_type => "varchar2", is_nullable => 1, size => 500 },
  "batch_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 batch

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Material>

=cut

__PACKAGE__->belongs_to(
  "batch",
  "MiaNet::Model::Schema::Result::Material",
  { id => "batch_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 record_field

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::RecordField>

=cut

__PACKAGE__->belongs_to(
  "record_field",
  "MiaNet::Model::Schema::Result::RecordField",
  { id => "record_field_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 step

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::RunStep>

=cut

__PACKAGE__->belongs_to(
  "step",
  "MiaNet::Model::Schema::Result::RunStep",
  { id => "step_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KOHncSf6IO6OqzvsyB0i8g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

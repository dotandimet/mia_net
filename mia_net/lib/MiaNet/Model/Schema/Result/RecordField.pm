use utf8;
package MiaNet::Model::Schema::Result::RecordField;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::RecordField

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<record_fields>

=cut

__PACKAGE__->table("record_fields");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 step_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 field_type

  data_type: 'varchar2'
  is_nullable: 0
  size: 10

=head2 field_name

  data_type: 'varchar2'
  is_nullable: 0
  size: 50

=head2 field_order

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "step_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "field_type",
  { data_type => "varchar2", is_nullable => 0, size => 10 },
  "field_name",
  { data_type => "varchar2", is_nullable => 0, size => 50 },
  "field_order",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 run_records

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::RunRecord>

=cut

__PACKAGE__->has_many(
  "run_records",
  "MiaNet::Model::Schema::Result::RunRecord",
  { "foreign.record_field_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 step

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Step>

=cut

__PACKAGE__->belongs_to(
  "step",
  "MiaNet::Model::Schema::Result::Step",
  { id => "step_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cU59mEWtkwtbbLXySYJkyg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

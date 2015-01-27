use utf8;
package MiaNet::Model::Schema::Result::RunStep;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::RunStep

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<run_steps>

=cut

__PACKAGE__->table("run_steps");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 step_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 start_time

  data_type: 'date'
  is_nullable: 1

=head2 end_time

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "step_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "start_time",
  { data_type => "date", is_nullable => 1 },
  "end_time",
  { data_type => "date", is_nullable => 1 },
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
  { "foreign.step_id" => "self.id" },
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
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SBcowqHdyTCP7+Oglr5bOQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

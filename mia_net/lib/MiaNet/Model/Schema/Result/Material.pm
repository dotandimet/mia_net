use utf8;
package MiaNet::Model::Schema::Result::Material;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::Material

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<materials>

=cut

__PACKAGE__->table("materials");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 product_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 for

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 receiving_date

  data_type: 'integer'
  is_nullable: 1

=head2 opening_date

  data_type: 'integer'
  is_nullable: 1

=head2 finishing_date

  data_type: 'integer'
  is_nullable: 1

=head2 batch_lot

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 product_catalog

  data_type: 'varchar2'
  is_nullable: 0
  size: 50

=head2 expiry_date

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "for",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "receiving_date",
  { data_type => "integer", is_nullable => 1 },
  "opening_date",
  { data_type => "integer", is_nullable => 1 },
  "finishing_date",
  { data_type => "integer", is_nullable => 1 },
  "batch_lot",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "product_catalog",
  { data_type => "varchar2", is_nullable => 0, size => 50 },
  "expiry_date",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 product

Type: belongs_to

Related object: L<MiaNet::Model::Schema::Result::Product>

=cut

__PACKAGE__->belongs_to(
  "product",
  "MiaNet::Model::Schema::Result::Product",
  { id => "product_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 run_records

Type: has_many

Related object: L<MiaNet::Model::Schema::Result::RunRecord>

=cut

__PACKAGE__->has_many(
  "run_records",
  "MiaNet::Model::Schema::Result::RunRecord",
  { "foreign.batch_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-30 12:45:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E8POrs6smWAOE36RcSuyXg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

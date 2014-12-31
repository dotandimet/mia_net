use utf8;
package MiaNet::Model::Schema::Result::WorkingMaterialsMia;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::WorkingMaterialsMia

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<working_materials_mia>

=cut

__PACKAGE__->table("working_materials_mia");

=head1 ACCESSORS

=head2 id

  data_type: (empty string)
  is_nullable: 1

=head2 name

  data_type: (empty string)
  is_nullable: 1

=head2 manufacturer

  data_type: (empty string)
  is_nullable: 1

=head2 supplier

  data_type: (empty string)
  is_nullable: 1

=head2 for

  data_type: (empty string)
  is_nullable: 1

=head2 receiving_date

  data_type: (empty string)
  is_nullable: 1

=head2 opening_date

  data_type: (empty string)
  is_nullable: 1

=head2 finishing_date

  data_type: (empty string)
  is_nullable: 1

=head2 batch_lot

  data_type: (empty string)
  is_nullable: 1

=head2 product_catalog

  data_type: (empty string)
  is_nullable: 1

=head2 cas#

  accessor: 'cas_'
  data_type: (empty string)
  is_nullable: 1

=head2 expiry_date

  data_type: (empty string)
  is_nullable: 1

=head2 storageconditions

  data_type: (empty string)
  is_nullable: 1

=head2 remarks

  data_type: (empty string)
  is_nullable: 1

=head2 common

  data_type: (empty string)
  is_nullable: 1

=head2 storagelocation

  data_type: (empty string)
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "", is_nullable => 1 },
  "name",
  { data_type => "", is_nullable => 1 },
  "manufacturer",
  { data_type => "", is_nullable => 1 },
  "supplier",
  { data_type => "", is_nullable => 1 },
  "for",
  { data_type => "", is_nullable => 1 },
  "receiving_date",
  { data_type => "", is_nullable => 1 },
  "opening_date",
  { data_type => "", is_nullable => 1 },
  "finishing_date",
  { data_type => "", is_nullable => 1 },
  "batch_lot",
  { data_type => "", is_nullable => 1 },
  "product_catalog",
  { data_type => "", is_nullable => 1 },
  "cas#",
  { accessor => "cas_", data_type => "", is_nullable => 1 },
  "expiry_date",
  { data_type => "", is_nullable => 1 },
  "storageconditions",
  { data_type => "", is_nullable => 1 },
  "remarks",
  { data_type => "", is_nullable => 1 },
  "common",
  { data_type => "", is_nullable => 1 },
  "storagelocation",
  { data_type => "", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-12-31 03:05:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+O12RNajCJTLumsX8ps1Yw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

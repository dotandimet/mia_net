use utf8;
package MiaNet::Model::Schema::Result::MaterialImported;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MiaNet::Model::Schema::Result::MaterialImported

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<material_imported>

=cut

__PACKAGE__->table("material_imported");

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

=head2 receivingdate

  data_type: (empty string)
  is_nullable: 1

=head2 openingdate

  data_type: (empty string)
  is_nullable: 1

=head2 finishingdate

  data_type: (empty string)
  is_nullable: 1

=head2 batch#/lot#

  accessor: 'batch_lot_'
  data_type: (empty string)
  is_nullable: 1

=head2 product#/catalog#

  accessor: 'product_catalog_'
  data_type: (empty string)
  is_nullable: 1

=head2 cas#

  accessor: 'cas_'
  data_type: (empty string)
  is_nullable: 1

=head2 expirydate

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
  "receivingdate",
  { data_type => "", is_nullable => 1 },
  "openingdate",
  { data_type => "", is_nullable => 1 },
  "finishingdate",
  { data_type => "", is_nullable => 1 },
  "batch#/lot#",
  { accessor => "batch_lot_", data_type => "", is_nullable => 1 },
  "product#/catalog#",
  { accessor => "product_catalog_", data_type => "", is_nullable => 1 },
  "cas#",
  { accessor => "cas_", data_type => "", is_nullable => 1 },
  "expirydate",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KQPPsfeZvnlpJnWDaLw2Jw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

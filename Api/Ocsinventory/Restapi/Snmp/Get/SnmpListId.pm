package Api::Ocsinventory::Restapi::Snmp::Get::SnmpListId;

=for comment

This function return a array of multiple snmp ID

Params: start, limit

=cut

# Common sub for api
use Api::Ocsinventory::Restapi::ApiCommon;
use Mojo::JSON qw(decode_json encode_json);

sub get_snmps_id {

    my $database = Api::Ocsinventory::Restapi::ApiCommon::api_database_connect();

    my $snmps = $database->selectall_arrayref(
        "SELECT id from snmp",
        { Slice => {} }
    );

    return encode_json($snmps);
}

1;

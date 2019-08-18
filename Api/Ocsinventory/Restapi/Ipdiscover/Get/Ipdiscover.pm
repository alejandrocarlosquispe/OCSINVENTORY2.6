package Api::Ocsinventory::Restapi::Ipdiscover::Get::Ipdiscover;

=for comment

This function return a array of multiple IPDiscover network

Params: start, limit

=cut

# Common sub for api
use Api::Ocsinventory::Restapi::ApiCommon;
use Mojo::JSON qw(decode_json encode_json);

sub get_ipdiscovers{

    my ($start, $limit) = @_;

    my $json_return;
    my $query = "SELECT NETID FROM `netmap` GROUP BY NETID";

    my $netmaps = Api::Ocsinventory::Restapi::ApiCommon::execute_custom_request($query, $start, $limit);

    return encode_json($netmaps);
}

1;

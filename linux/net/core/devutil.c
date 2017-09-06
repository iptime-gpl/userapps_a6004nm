#include <linux/config.h>
#include <linux/types.h>
#include <linux/if_ether.h>
#include <linux/inetdevice.h>
#include <linux/etherdevice.h>

unsigned char  ipclone_mac[2][6] = {{0,0,0,0,0,0}, {0,0,0,0,0,0}};
unsigned int get_dev_ip( struct net_device *dev )
{
        struct in_device *in_dev;
        struct in_ifaddr **ifap = NULL;
        struct in_ifaddr *ifa = NULL;

        in_dev = (struct in_device *)(dev->ip_ptr);
        if( !in_dev ) return 0;

        ifap = &in_dev->ifa_list;
        ifa=*ifap;
        if(!ifa) return 0;

        return ifa->ifa_local;
}

EXPORT_SYMBOL(ipclone_mac);
EXPORT_SYMBOL(get_dev_ip);


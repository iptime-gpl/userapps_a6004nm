#ifndef _NF_CONNTRACK_TUPLE_COMMON_H
#define _NF_CONNTRACK_TUPLE_COMMON_H

enum ip_conntrack_dir {
	IP_CT_DIR_ORIGINAL,
	IP_CT_DIR_REPLY,
	IP_CT_DIR_MAX
};

/* The protocol-specific manipulable parts of the tuple: always in
 * network order
 */
union nf_conntrack_man_proto {
	/* Add other protocols here. */
#ifdef CONFIG_NF_NAT_PROTO_ESP
	__be32 all;
#else
	__be16 all;
#endif

	struct {
		__be16 port;
	} tcp;
	struct {
		__be16 port;
	} udp;
	struct {
		__be16 id;
	} icmp;
	struct {
		__be16 port;
	} dccp;
	struct {
		__be16 port;
	} sctp;
	struct {
		__be16 key;	/* GRE key is 32bit, PPtP only uses 16bit */
	} gre;
#ifdef CONFIG_NF_NAT_PROTO_ESP
	struct {
		__be32 spi;
	} esp;
#endif
};

#define CTINFO2DIR(ctinfo) ((ctinfo) >= IP_CT_IS_REPLY ? IP_CT_DIR_REPLY : IP_CT_DIR_ORIGINAL)

#endif /* _NF_CONNTRACK_TUPLE_COMMON_H */
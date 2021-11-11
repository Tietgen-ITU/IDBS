# Question
## **Question 1.A** Select the correct statements below:

- (a) SSDs are especially well suited to improve performance of retrieving large result sets
using unclustered indexes.

- (b) Before a transaction can be committed, all the disk pages it has updated must be
written to secondary storage to ensure durability.

- (c) In a main memory system, it is not necessary to include the **old** values when logging
changes made by transactions to secondary storage.

- (d) As discussed in a lecture, Google claims to have built a distributed system that offers
both consistency and availability in the face of network partitions; this proves that
the CAP theorem is wrong.

> Answer: a, b

-- TODO jeg er ikke sikker på b endnu. a er nok sand. Den er god til random access, og unclustered data er pointers der referer hulter til bulter

## **Question 1.B** Reflect upon why ACID transactions are rarely used in distributed systems.

The ACID properties of a distributed system is not easy to implement without loosing performance.
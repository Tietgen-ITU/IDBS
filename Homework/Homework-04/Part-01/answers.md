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

> **Answer:** The ACID properties of a distributed system is not easy to implement without loosing performance.

## **Question 2.A** Select the correct statements below:
- (a) Today's key-value stores implement all the functionality required to support *all*
needs of analytics applications.
- (b) In big data, velocity means that it is necessary to react quickly to the large amounts
of data being added to the system.
- (c) The information that multimedia content (image, video and audio content) is inherently very unstructured in nature.
- (d) Big data analytics applications cannot be implemented on any system unless that
systems supports ACID transactions.

## **Question 2.B** 
Consider a scenario where you have 1PB of raw data les that have just
been produced as a result of a scientic experiment. You are trying to make scientic discoveries using this data, using complex computations, and also determine the experiments
you would like to perform in the future. You have a cluster of machines in your lab (100ish
nodes), which have 128GB main-memory and 16 cores each. Explain (with convincing
arguments) what type of data management/processing system you would you pick for this
scenario.
#include "types.h"
#include "stat.h"
#include "user.h"

int
main()
{
  printf(1, "%s\n", "GDT:");
  struct segdesc gdt;
  user(&gdt);

  printf(1, "%s", "Low bits of segment limit: ");
  printf(1, "%d\n", gdt.lim_15_0);

  printf(1, "%s", "Low bits of segment base address: ");
  printf(1, "%d\n", gdt.base_15_0);

  printf(1, "%s", "Middle bits of segment base address: ");
  printf(1, "%d\n", gdt.base_23_16);

  printf(1, "%s", "Segment type (see STS_ constants): ");
  printf(1, "%d\n", gdt.type);

  printf(1, "%s", "0 = system, 1 = application: ");
  printf(1, "%d\n", gdt.s);

  printf(1, "%s", "Descriptor Privilege Level: ");
  printf(1, "%d\n", gdt.dpl);

  printf(1, "%s", "Present: ");
  printf(1, "%d\n", gdt.p);

  printf(1, "%s", "High bits of segment limit: ");
  printf(1, "%d\n", gdt.lim_19_16);

  printf(1, "%s", "Unused (available for software use): ");
  printf(1, "%d\n", gdt.avl);

  printf(1, "%s", "Reserved: ");
  printf(1, "%d\n", gdt.rsv1);

  printf(1, "%s", "0 = 16-bit segment, 1 = 32-bit segment: ");
  printf(1, "%d\n", gdt.db);

  printf(1, "%s", "Granularity: limit scaled by 4K when set: ");
  printf(1, "%d\n", gdt.g);

  printf(1, "%s", "High bits of segment base address: ");
  printf(1, "%d\n", gdt.base_31_24);
}

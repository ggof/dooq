part of dooq.delete;

abstract class DeleteWhereStep implements DeleteFinalStep {
  DeleteWhereStep where(Condition condition);
}

abstract class DeleteFinalStep implements Serializable {}
